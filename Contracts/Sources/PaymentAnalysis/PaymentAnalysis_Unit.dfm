object frmPayment: TfrmPayment
  Left = 414
  Top = 150
  Width = 807
  Height = 576
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmPayment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    791
    538)
  PixelsPerInch = 96
  TextHeight = 13
  object FIO_Label: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = #1060'.'#1048'.'#1054'. :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8540482
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Fac_Label: TLabel
    Left = 8
    Top = 32
    Width = 59
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8540482
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Kurs_Label: TLabel
    Left = 657
    Top = 32
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = #1050#1091#1088#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8540482
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DataRog_Label: TLabel
    Left = 594
    Top = 8
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    Visible = False
  end
  object FIOCOMBO_Label: TLabel
    Left = 56
    Top = 8
    Width = 3
    Height = 13
    Transparent = True
  end
  object Comment_Label: TLabel
    Left = 264
    Top = 494
    Width = 249
    Height = 51
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1086#1087#1083#1072#1090#1099' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Comment_DB_Label: TLabel
    Left = 8
    Top = 491
    Width = 249
    Height = 51
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1086#1087#1083#1072#1090#1099' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
    WordWrap = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 80
    Width = 783
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object calcTable: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '= 0.00'
          Kind = skSum
          FieldName = 'SUMMA_ZA_PERIOD'
          Column = Summa
        end
        item
          Format = '= 0.00'
          Kind = skSum
          FieldName = 'STOIMOST'
          Column = Pay_Sum
        end
        item
          Format = '= 0.00'
          Kind = skSum
          FieldName = 'POSTUPIV_SUMMA'
          Column = clSummaNadiyshla
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = DevExpress_Style
      object Beg_Date: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        HeaderAlignmentHorz = taCenter
        Width = 84
        DataBinding.FieldName = 'BEG_DATE'
      end
      object End_Date: TcxGridDBColumn
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        HeaderAlignmentHorz = taCenter
        Width = 82
        DataBinding.FieldName = 'END_DATE'
      end
      object Pay_Sum: TcxGridDBColumn
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1073#1091#1095#1077#1085#1080#1103', '#1075#1088#1085'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 101
        DataBinding.FieldName = 'STOIMOST'
      end
      object SummaLg: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1086#1074#1072#1103' '#1083#1100#1075#1086#1090#1072', '#1075#1088#1085
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 77
        DataBinding.FieldName = 'SUMMA_LG'
      end
      object Persent: TcxGridDBColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099', %'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 81
        DataBinding.FieldName = 'PERCENT_LG'
      end
      object clBorgNa4alo: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        Width = 70
        DataBinding.FieldName = 'DOLG_NACHALO'
      end
      object Summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076', '#1075#1088#1085
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 86
        DataBinding.FieldName = 'SUMMA_ZA_PERIOD'
      end
      object NumYearColumn: TcxGridDBColumn
        Caption = #1040#1082' '#1088#1099#1082
        Visible = False
        Hidden = True
        DataBinding.FieldName = 'num_year'
      end
      object clSummaNadiyshla: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        Width = 89
        DataBinding.FieldName = 'POSTUPIV_SUMMA'
      end
      object clBorgKinez: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        Width = 102
        DataBinding.FieldName = 'DOLG_KONEZ'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = calcTable
    end
  end
  object CancelButton: TcxButton
    Left = 674
    Top = 515
    Width = 116
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1082
    TabOrder = 6
    OnClick = CancelButtonClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    Spacing = 6
    UseSystemPaint = False
  end
  object cxGrid2: TcxGrid
    Left = 264
    Top = 318
    Width = 250
    Height = 172
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    LookAndFeel.Kind = lfUltraFlat
    object DocTable: TcxGridDBTableView
      OnDblClick = DocTableDblClick
      OnKeyPress = DocTableKeyPress
      DataController.DataSource = DM_Pay.DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = Doc_summa
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object Doc_num: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 182
        DataBinding.FieldName = 'DOC_NOMER_COMBO'
      end
      object Doc_date: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 110
        DataBinding.FieldName = 'DATE_DOC'
      end
      object Doc_summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.00'
        HeaderAlignmentHorz = taCenter
        Width = 107
        DataBinding.FieldName = 'SUMMA'
      end
      object Note: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object id_doc: TcxGridDBColumn
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = DocTable
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 523
    Top = 312
    Width = 268
    Height = 179
    Alignment = alTopLeft
    Anchors = [akRight, akBottom]
    Caption = #1048#1090#1086#1075#1086
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 51
      Top = 37
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072#1076#1086' '#1086#1087#1083#1072#1090#1080#1090#1100':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 54
      Top = 61
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = #1059#1078#1077' '#1086#1087#1083#1072#1095#1077#1085#1086':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Zadolg_Label: TLabel
      Left = 46
      Top = 110
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DateOpl_Label: TLabel
      Left = 46
      Top = 132
      Width = 171
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1087#1086' '
      Color = 13598296
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4756269
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 22
      Top = 156
      Width = 107
      Height = 13
      Alignment = taRightJustify
      Caption = #1050' '#1086#1087#1083#1072#1090#1077' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object InsOstLabel: TLabel
      Left = 68
      Top = 86
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1093'. '#1086#1089#1090#1072#1090#1086#1082':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Lgota_Label: TLabel
      Left = 93
      Top = 13
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #1051#1100#1075#1086#1090#1072
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object cn_SNeed_Edit: TcxCurrencyEdit
      Left = 132
      Top = 33
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      TabOrder = 1
    end
    object cn_UplSum_Edit: TcxCurrencyEdit
      Left = 132
      Top = 57
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      TabOrder = 2
    end
    object Zadolgnost_Edit: TcxCurrencyEdit
      Left = 132
      Top = 106
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object Today_Opl_Edit: TcxCurrencyEdit
      Left = 132
      Top = 152
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      TabOrder = 5
    end
    object InsOst_Edit: TcxCurrencyEdit
      Left = 132
      Top = 82
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      TabOrder = 3
    end
    object Lgota_Edit: TcxCurrencyEdit
      Left = 132
      Top = 9
      Width = 117
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = clBtnFace
      TabOrder = 0
    end
  end
  object Calc_CountButton: TcxButton
    Left = 12
    Top = 286
    Width = 161
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Calc_CountButton'
    TabOrder = 1
    OnClick = Calc_CountButtonClick
    LookAndFeel.NativeStyle = False
  end
  object Pay_CountButton: TcxButton
    Left = 268
    Top = 467
    Width = 93
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Pay_CountButton'
    TabOrder = 4
    OnClick = Pay_CountButtonClick
    LookAndFeel.NativeStyle = False
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 8
    Top = 52
    Width = 681
    Height = 26
    Align = dalNone
    BarManager = dxBarManager1
  end
  object cxGrid3: TcxGrid
    Left = 8
    Top = 320
    Width = 250
    Height = 169
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridDBTableView1DblClick
      DataController.DataSource = DM_Pay.DataSource_calc
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = cxGridDBColumn3
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 182
        DataBinding.FieldName = 'NUM_DOC'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 110
        DataBinding.FieldName = 'DATE_DOC'
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.000'
        HeaderAlignmentHorz = taCenter
        Width = 107
        DataBinding.FieldName = 'SUMMA'
      end
      object cxGridDBColumn4: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object cxGridDBColumn5: TcxGridDBColumn
        Visible = False
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object Button_calc: TcxButton
    Left = 12
    Top = 467
    Width = 93
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Pay_CountButton'
    TabOrder = 12
    OnClick = Pay_CountButtonClick
    LookAndFeel.NativeStyle = False
  end
  object Styles: TcxStyleRepository
    Left = 296
    Top = 184
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14274999
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle7
      Styles.Content = cxStyle8
      Styles.ContentEven = cxStyle9
      Styles.ContentOdd = cxStyle10
      Styles.Inactive = cxStyle16
      Styles.IncSearch = cxStyle17
      Styles.Selection = cxStyle20
      Styles.FilterBox = cxStyle11
      Styles.Footer = cxStyle12
      Styles.Group = cxStyle13
      Styles.GroupByBox = cxStyle14
      Styles.Header = cxStyle15
      Styles.Indicator = cxStyle18
      Styles.Preview = cxStyle19
      BuiltIn = True
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Sorting'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 482
        FloatTop = 348
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = IsSortingBtn
            Visible = True
          end>
        Name = 'Sorting'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = PopupImageList
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 328
    Top = 464
    DockControlHeights = (
      0
      0
      0
      0)
    object IsSortingBtn: TdxBarButton
      Caption = 'IsSortingBtn'
      Category = 0
      Hint = 'IsSortingBtn'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 25
      OnClick = IsSortingBtnClick
    end
    object TreeFullOpenBtn: TdxBarButton
      Caption = 'TreeFullOpenBtn'
      Category = 0
      Hint = 'TreeFullOpenBtn'
      Visible = ivNever
      ImageIndex = 20
      OnClick = TreeFullOpenBtnClick
    end
    object TreeFullCloseBtn: TdxBarButton
      Caption = 'TreeFullCloseBtn'
      Category = 0
      Hint = 'TreeFullCloseBtn'
      Visible = ivNever
      ImageIndex = 18
      OnClick = TreeFullCloseBtnClick
    end
    object TreeBranchOpenBtn: TdxBarButton
      Caption = 'TreeBranchOpenBtn'
      Category = 0
      Hint = 'TreeBranchOpenBtn'
      Visible = ivNever
      ImageIndex = 21
      OnClick = TreeBranchOpenBtnClick
    end
    object TreeBranchCloseBtn: TdxBarButton
      Caption = 'TreeBranchCloseBtn'
      Category = 0
      Hint = 'TreeBranchCloseBtn'
      Visible = ivNever
      ImageIndex = 22
      OnClick = TreeBranchCloseBtnClick
    end
  end
  object PopupImageList: TImageList
    Left = 230
    Top = 146
    Bitmap = {
      494C01011B001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000002880001089300010B9900010C990001089300000389000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C00000000000000000000000000000001
      8600010D9D00021CAF00021FB400021FB500021FB500021FB200021CB000010F
      9F00000287000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000FFEDD900FFEAD300FFE7
      CE00811E0000FEE1C000FEDDBB00FEDAB400811E0000FED5A900FED3A400FFD0
      9F00811E0000FECC9800FECB9600BD4C0000000000000000000000038A000118
      B200021FB700021EB100021DB100021DB100021DB100021DB100021EB200021F
      B4000219AC0000048E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000FFEFDE00FFEDD800FEEA
      D100811E0000FEE3C500FEE0C000FEDDB800811E0000FED8AC00FED4A900FFD3
      A300811E0000FECF9A00FECC9800BD4C000000000000000183000118BB000220
      CC00011CBF000015B400011AB000021DB100021DB100011CB0000015AD00011B
      B000021FB400021AAC0000028700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000000000000000000000000000CA680000CA68000000000000000000000000
      000000000000CA680000CA68000000000000BD4C0000FFF0E200FEEEDD00FEEB
      D700811E0000FEE5CA00FEE2C200FEDEBD00811E0000FEDAB200FED5AB00FED4
      A700811E0000FFD09E00FECE9900BD4C000000000000010CA7000121E000011C
      D3000726CC004966D7000B28BC000018B0000019AF000622B4004A66CE000D2B
      B700011BB000021FB500010F9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000000000000000000000000000CA680000CA68000000000000000000000000
      000000000000CA680000CA68000000000000BD4C0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000BD4C000000018700011CDC000120ED000017
      DC003655E200FFFFFF00A4B4ED000520BB000119B2008B9EE100FFFFFF004E6A
      CF000014AC00021EB200021CB000000389000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000FFF6ED00FFF3E600FFEF
      E100811E0000FFEAD400FFE7CE00FEE5C600811E0000FEDEBB00FEDAB500FFD8
      AF00811E0000FED3A500FED0A000BD4C000000069A000120F800011FF600001D
      E900031FE100738BEE00FFFFFF00A0B1ED0093A5E700FFFFFF0091A4E2000823
      B400011BB000021DB100021FB400010895000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000FFF8F000FFF6EA00FFF3
      E500811E0000FFEDD900FFEAD300FFE6CC00811E0000FEE1BF00FFDDB800FED9
      B200811E0000FED4A700FFD3A400BD4C0000020CAA000A2EFE000323FB00011F
      F600001CEB000018E100788FF000FFFFFF00FFFFFF0096A7EA00021BB5000019
      AF00021DB100021DB1000220B500010C99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000FFFAF300FFF7EE00FFF6
      EA00811E0000FEEFDD00FFEBD700FFE9D000811E0000FFE2C500FFE0BD00FEDD
      B800811E0000FED7AC00FED4A600BD4C0000040EAC00294DFE000D30FB00011F
      FA00001CF700011CEE008EA1F400FFFFFF00FFFFFF00A6B6EE000520C2000018
      B600021DB100021DB1000220B500010B98000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000BD4C00000208A0004162FB002F51FC00001E
      FA000725FA008AA0FE00FFFFFF008EA3F6007991F200FFFFFF00A3B4EE000C29
      C600011BB800021DB400021FB200000793000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000000000000000000000000000CA680000CA68000000000000000000000000
      000000000000CA680000CA68000000000000BD4C0000FFFCFA00FFFAF600FFF8
      F200811E0000FFF4E700FFF0E100FFEDDA00811E0000FFE7CE00FFE3C700FFE1
      C100811E0000FEDAB500FED9AF00BD4C000000018900314FEF007690FF000F2D
      FA003354FB00FFFFFF0091A5FE00021EF3000017E700738BF300FFFFFF004765
      E0000016C200021FBD00021CB200000288000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000000000000000000000000000CA680000CA68000000000000000000000000
      000000000000CA680000CA68000000000000BD4C0000FFFFFC00FFFCF800FFFA
      F600811E0000FFF6EA00FEF3E600FFF0DE00811E0000FFEAD300FFE6CC00FEE3
      C600811E0000FEDDBA00FEDAB400BD4C0000000000000C1BBC00819AFF00728B
      FE001134FA003456FB000526FA00001CFA00001CF4000220ED003353ED000625
      DA00011DD0000220CB00010DA100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000FFFFFF00FFFEFC00FFFC
      F800811E0000FEF7EF00FFF4EA00FFF2E300811E0000FFEDD700FFE9D100FFE6
      CB00811E0000FEE0BD00FFDDB800BD4C000000000000000189002943E600A5B7
      FF00849AFC002341FB000323FA00011FFA00011FFA00001EF700011BEE00021F
      E5000121E2000118BF0000018400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000000000000000000001038F002A45
      E60093A9FF00ABBBFF00758FFE004969FC003658FB003153FC002346FC00092C
      F7000118CB0000038B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000CA6800000000
      0000CA680000CA68000000000000CA680000CA68000000000000CA680000CA68
      000000000000CA680000CA68000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C00000000000000000000000000000001
      89000F1DBF003E5BF3006B87FE00728CFF005E7BFE00395BFB001231EB00010F
      B500000184000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000018900030AA3000611B200050FB1000107A000000188000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      000000000000000000000000000000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B000011A4
      2300004B00000000000000000000000000000000000000000000004B000011A4
      2300004B00000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000027BF46001AAD
      310011A42300004B0000000000000000000000000000004B000027BF46001AAD
      310011A42300004B000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000040DE70002DC5530023B6
      400018AB2E0011A42300004B000000000000004B000040DE70002DC5530023B6
      400018AB2E0011A42300004B0000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00003EDC6F002DC5
      530027BF4600004B0000000000000000000000000000004B00003EDC6F002DC5
      530027BF4600004B000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B00003EDC
      6F00004B00000000000000000000000000000000000000000000004B00003EDC
      6F00004B00000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      000000000000000000000000000000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000046
      0000000000000000000000000000000000000000000000000000000000000046
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      0000004B00000053000000530000004B00000053000000530000004B0000004B
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000350F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C0000BD4C0000BD4C0000BD4C000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      0000000082000000820000008200000082000000820000008200000082000000
      0000000000000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5009C3B0D009C3B0D009C3B0D009C3B
      0D009C3B0D000000000000000000000000000000000000000000000000000017
      DD000017DD00000000000017DD000017DD000000000000000000000000000000
      0000BD4C00000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      0000000082000528F4000124FF000018F8000011D8000108AF00000082000000
      00000000000000000000000000000000000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B5009C3B0D00FFCF9200EBA45A00DD88
      2E009C3B0D000000000000000000000000000000000000000000000000000017
      DD000017DD000017DD000017DD000017DD000000000000000000842405008424
      0500842405008424050084240500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082001639EB000C36FF000124FF000018F800000ED000000082000000
      0000000000000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B500000000009B390B009C3B0D009C3A0D009B3A
      0C009C3B0D000000000000000000000000000000000000000000000000000000
      00000017DD000017DD000017DD0000000000000000000000000084240500FFC1
      7900E58E4000D36E1A0084240500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082002449EB00204EFF000E38FF000328FF000016E700000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000017
      DD000017DD000017DD000017DD000017DD000000000000000000832304008424
      0500842305008323040084240500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082002D55F300366AFF002758FF001546FF000528F400000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000017
      DD000017DD00000000000017DD000017DD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000820000008200000082000000820000008200000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000082000000820000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000007D000111B0000111B00000000000000000000000
      8200000082000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000082000000
      82000000820000000000000695000111B0000111B00000008200000082000009
      9D00000082000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C0000BD4C0000BD4C0000C24F000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000082000111
      B0000000820000008200011BCC000111B0000111B000011BCC000111B0000115
      BA00000082000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008200011B
      CC00011BCC00011CC700011BCC000111B0000111B000011BCC00011BCC00011B
      CC00000082000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      000000000000000000000000000000000000000000000000000000008200011E
      DA00011BCC00011CC700011CC7000111B0000111B0000118C200011CC700011C
      C700000082000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      000000000000000000000000000000000000000000000000000000008200001E
      E900011EDA000012CE00011BCC00243CC7001E2EBA000F2DCB000111B000011C
      C700000082000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C0000BD4C0000BD4C0000BD4C000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000082000122
      F7001F40EA007D91EF00CAD3F600E9E9F300BCBCE200E1E6FA00B0BDF0007D91
      EF001A25AC000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008200EBF2
      FF00FFFFFF00EBF2FF00B4C2FB00586CE1003A4BC90090A3EE00C2CCF300E9EE
      FC00B2B2E0000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      000000000000000000000000000000000000000000000000000000008200AABF
      FF004365FF001536FA00001EE900000FD900000DC0000012CE00011BCC001534
      CF001E2CB2000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000082001A48
      FF00072CFF000122FF00001DFE000018E7000012CE00001EE900011BCC000118
      C200000082000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C0000BD4C0000BD4C0000BD4C000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      000018640C001C620C0000000000000000000000000000000000000082003262
      FF001A48FF00133CFF00082DFF00011DF0000115BA000118C2000012CE00011B
      CC00000082000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD4C00000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      00001C650D001C660E000000000000000000000000000000000000008200376A
      FF002E5CFF002752FF001A44FF000A28E9000D1BB2002F58F400203CD7000111
      B0000000820000000000000000000000000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      0000000000000008E10000000000000000000000000000000000842405008424
      0500842405008424050084240500000000000000000000000000000000000000
      00000000000000000000000000000000000084240500FFC17900E58E4000D36E
      1A008424050000000000000000000000000000000000000000001B670F001874
      160018781800187617001A6D12001C650D000000000000000000000082002E5C
      FF003262FF003262FF002E5CFF000D1FC00002049800060AA1000115BA00001D
      FE00000082000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000008E100000000000008E10000000000000000000000000084240500FFC1
      7900E58E4000D36E1A0084240500000000000000000000000000000000000000
      0000000000000000000000000000000000008323040084240500842305008323
      04008424050000000000000000000000000000000000000000001B670F001973
      1600187E1C00187B1B001A6C11001C650D000000000000000000000000000000
      82002A51EE002A51EE002241DE001B33CC00162AC9000917BD000111B0000000
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000832304008424
      0500842305008323040084240500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187919001879190000000000000000000000000000000000000000000000
      0000000000000000820000008200000082000000820000008200000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B6910001B69100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D69FF00908A820077736C000000000000000000C8C8C8008F8F8F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000012121200060606000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B00F37B7D007B484800000000000000
      0000824B4B00824B4B000000000000000000000000000000000000000000AA71
      7100A4717100AB7A7A00AB787800A5727200936060006F3A3A006B3333003277
      FF002A7BFF007FDEFF009890850000000000A3A3A300FDFDFD00A9A9A9000A0A
      0A003B3B3B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000282828001A1A
      1A00101010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009252
      52008B4F4F0000000000824B4B00FF848600EE797A00824B4B0000000000824B
      4B00B44A4B00824B4B0000000000000000000000000000000000BA838300ECC1
      C100F6CFCF00E3B5B500E1B3B300D3A4A400C4959500AD7A7A0060649A002A77
      F80071E1FF003188FF00216AFC000000000000000000C4C4C4002B2B2B000000
      0000000000000A0A0A00ABABAB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002C2C
      2C00262626000D0D0D006E6E6E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000874D4D00F680
      810092525300824B4B00F77E7F00FF848600D36E6F00AD5E5E00BC646500BD5E
      5E00AB575800804B4B00824B4B00000000000000000000000000C99B9B00FFEF
      EF00E9CDCD00DBB5B5009B8D8D007874750073706F00756E6E008D8986008CC5
      D6002D83FF00347AFF00000000000000000000000000000000005D5D5D005858
      58000101010000000000000000001A1A1A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B2B2B00323232001C1C1C00020202000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00EB7A
      7B00824B4B00F27B7D00FF848600EF7A7B00B6626300FF828300FF828300FE82
      8300FC818200FC818200A6555500984A4A000000000000000000C8A0A000F7DA
      DA00EBBEBE009E8F9000BDAA9000FFD18400FED08500FED698009A948B008C8A
      87003D7BED000000000000000000000000000000000000000000000000000000
      000033333300252525000000000000000000050505006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002E2E2E003E3E3E0028282800121212002828280093939300A5A5
      A500000000000000000000000000000000000000000000000000824B4B00B263
      6300F7868800FF848600FF838400B6626300EE7A7B00FF828300FF818200FF82
      8300FF818200FF838400CC585900A54B4C000000000000000000CB9B9B00FFE3
      E300F7E3E300807C7A00FFDD9700F2D59800EFCD9000F1C88200FED99D006A62
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000202020005555550000000000000000009B9B9B00A1A1A100C3C3
      C300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000333333004C4C4C0040404100CBCBB600EDEDD000FFFF
      E40085857B0000000000000000000000000000000000824B4B00D9747400EF8C
      8C00FF929300FF8B8B00FF898A00B6626300F27A7B00FF828300FF818200F07B
      7B00FE808100FF828300F2777900A44F50000000000000000000CCA4A400F9E1
      E100E7C6C6007B777200FFEEBD00F8E8BB00F4DDA900F0D09400FFD59000716D
      6C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000666666005353530075757500EDEDED00D6D6D600C9C9
      C9008F8F8F00D8D8D80000000000000000000000000000000000000000000000
      00000000000000000000000000004242420097978C00C8C8B400DBDBC200E3E3
      C800DDDDC4005E5E5E00000000000000000000000000824B4B00DA7D7E00FFA0
      A000FF989900FF939500FF919200DE787800DA727300FF828300824B4B00824B
      4B00FE828300FF828300824B4B00000000000000000000000000CD9D9D00FFDE
      DE00F2D0D000827D7900FFFFEA00FFFEEF00F9EDC200F6DAA000FFDA96006D65
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000077AAB000000000000000000B7B7B700F7F7F700FAFAFA00D3D3
      D300EEEEEE00D9D7D70000000000000000000000000000000000000000000000
      0000786E6C00000000000000000000000000ACAC9F00C4C4B500C5C5B100CBCB
      B500C6C6B10074747000000000000000000000000000824B4B00DA868600FB9F
      9F00FFA0A000FF9C9D00E5878700A55D5D00B4626200E17E7E00F88C8E00FC88
      8900FF878800FF8A8B00824B4B00000000000000000000000000D0A7A700F9E8
      E800F3E3E300A5A0A000DEDAC400FFFFF200FFF7CB00FFE7A600B1A290007967
      67000000000000000000000000000000000000000000000000005ED3E700137B
      AA0020B0D80058C7DD00000000000000000000000000C1C1C100E6E6E600DEDE
      DE000074AB00197FAD0095C7DD000000000000000000B8AAA80087726F007864
      6100FFFFF80000000000000000000000000096969000D5D5CE00D8D8D000D4D4
      CB00766A6600615F6000000000000000000000000000824B4B00F6AAAA00F7A5
      A500FFAAAA00FFA7A900E5909100A0646400EA7D7E00CE707000EF929300FF9A
      9A00FF999A00F3909000824B4B00824B4B000000000000000000CCA0A000FFDE
      DE00F0CBCB00E4BCBC00A29696007F7B79007A77730079747300867777006C3A
      3A0000000000000000000000000000000000000000000000000027A7CB006BF0
      FF0007D0FF003ECEEC0000000000000000000000000000000000C2C1C100DADA
      DA003C9AC00075FAFF000C90C00000000000000000009B818100FFFFFD00FFEB
      CE00FFE9C3006C5B5C000000000000000000D1D1D100B7B7B200E5E5E100D2D4
      CE0093787100EBD9C000000000000000000000000000824B4B00FFC7C700FFBB
      BB00FFBABA00FFB8BA00FBB4B500AB6F6F00C1626300BD676700E99C9D00FFAC
      AD00FCA9A900C9767500E1747300824B4B000000000000000000D3A6A600FFDB
      DB00F0CACA00E8C3C300E8C5C500DDB9B900CCA7A700BA929200834F4F006A37
      37000000000000000000000000000000000000000000000000000692C20089FA
      FF0055E7FF0007CFFF0070FAFF00238EB100000000000483B200000000000000
      000078C9E7000B92C100000000000000000000000000D9C9CA00FFFAE500FFFD
      FB00FFECD000FFF1C400AFA19B0000000000000000006C5F5F00C4C6C600D3CF
      D000A18283008D727200BEB1B1000000000000000000824B4B00F6AAAA00FFC0
      C000FFBDBD00FFBDBD00FFC0C000FFBCBC00D1979600E2A5A500FFC0C000FFC2
      C200CE8C8C00824B4B00824B4B00000000000000000000000000CEA5A500FFFD
      FD00FFF1F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7ACAC007C48
      4800000000000000000000000000000000000000000051B6DE001ADDFF0043E7
      FF0095FDFF001AA7D10066B2D500000000000000000070E4F100118BBA000487
      B8000000000000000000000000000000000000000000DFC8B900F7DBB300FFF9
      E300FFFFFF0000000000000000008A706F00755E5F00FFF7CD008B8182000000
      0000000000000000000000000000000000000000000000000000824B4B00FFC7
      C700FFBDBD00FFBDBD00FFC1C100F6ADAB00FEAAA500EDA4A100F7BABB00824B
      4B00874F4F000000000000000000000000000000000000000000C38C8C00B37F
      7F00BF909000C1949400BE919100BA8B8B00B1838300A879790094606000824F
      4F00000000000000000000000000000000000000000000000000000000000000
      000050E2FB0038A0CE0000000000000000002EC9ED008DFBFF0053EBFF008ABF
      D90000000000000000000000000000000000000000000000000000000000B595
      9700F9E8D4000000000000000000D8C7C700FFFDF300FFF2DD00FFF2C8007D70
      700000000000000000000000000000000000000000000000000000000000824B
      4B00FCBCBC00FCBFBF00C28E900079819100277BA300535A6A00824B4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000064C4E8000000000000000000000000000000000093FFFF002CB7DD001A7E
      AF00000000000000000000000000000000000000000000000000000000000000
      0000D9C3C300000000000000000000000000FFF4C400F8EEE500957C79000000
      0000000000000000000000000000000000000000000000000000814A4A007F48
      480084494900824B4B00057BB20000A9EB00057BB200216A8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074BBDA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDCBCB00000000009D7A7A000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00000000000000000000000000057BB200057BB20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F1E
      1F001F2325000D222B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D4663000362920006365100161A1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A0000000000000000000000000000000000000000009B7C6B009D7E
      6D009C7E6D009C7E6D009C7E6D009C7D6D009C7D6C009B7C6B009B7C6B009A7C
      6A00997B68009B7C6B0000000000000000000000000098656500AA787800B385
      8400A16965009E6A680099696900B65555000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BC4B0000BC4B0000B64A
      00001C414500165E8200745D65007D525400572D1F006C300400883A0300A342
      0100B84A0000BC4B0000BC4B00000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A0000000000000000009B776600FFFF
      FF00FAF4E900FAF4E900EEE9DE00E8E2D800F7F0E400FAF2E600FAF1E400F9EF
      E000F8EDDA00977967000000000000000000000000009B666600D2ABA900FFFF
      FF0098A9FF00F0D8D400D3B1B300BC969700B07B7B00A46B6B00B67878000000
      000000000000000000000000000000000000BD4C0000FFFFFF00FFFFFF00FFF8
      F20093A5A50062555D00DD908C00B87979008E5757005D3D3600846C5300A183
      6300E1B58600FECB9600BC4B000000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A00000000000000000000000000A27F6F00FFFF
      FF00DDC2B500DDC2B500B5A9A400B1A19A00DBC2B400DCBBA900DCBAA500DCBA
      A300FAF1E2009879680000000000000000000000000098666600D9B3AF00FFF7
      E00099A3E800FFF1D800F9E1CE00FFECDD00FFF5F100FAE6E700A56C6C000000
      000000000000000000000000000000000000BD4C0000FFFFFF00C0582D008936
      1C0086391F005D484A00E9A4A100CF909000B2757500875353005A3C35007F68
      4F00C59F7600FECB9600BC4B0000000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A00767373000000000000000000A3807000FFFF
      FF00DBC3BB00EADDD7006F6D7100928B9600C3CDB900E8D6CC00DAB8A500DCB9
      A500FAF3E600997A6A000000000000000000000000009B686800E0BCB400FFF6
      DD009DA5E800F8E3D000D6C9C600FFF7F300FFEBDD00FFE0CD00A86F70000000
      000000000000000000000000000000000000BD4C0000FFFFFF00CB532A00FF5D
      3500FFFFFF00F396810084525000E2A1A100CE8F8F00B4767600865252005D3E
      3600B4916D00FECB9600BC4B0000000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A787800757373000000000000000000A9877800FFFF
      FF00DBC7C200E9DDDA00A8BBCE0034B356002CB4440071B46F00ECDBD200DCBB
      A700FBF4E800997B6B000000000000000000000000009F696900E8C8C600FFFE
      F400A0B1FD00F0E7E200424B530078716A00B6B28D00FED9CA00AF7275000000
      000000000000000000000000000000000000BD4C0000FFFFFF00F0C5B8008981
      9900157BB6007E91A700D0A0900087595900E1A1A100CC8E8E00B07474008651
      510072422700FECB9600BC4B0000000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C6969000000000000000000AB897A00FFFF
      FF00DBC7C300E6D7D40099D0A70066FF98005AEC86002EAD460087BE8100EAD8
      CC00FBF5EA009A7C6B00000000000000000000000000A06B6B00F1D4D200FFFA
      E900A3ACEB00FFF4DD00669EA80024A94200139A2B00367D3200BB7A7E000000
      000000000000000000000000000000000000BD4C0000FFFFFF0084BCEA00157B
      B6001F87E900157BB600B0D7F600DCCFC70089575300E6A6A600CA8B8B00B675
      7500814844003E414500BC4B000000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A000000000000000000AF8E7F00FFFF
      FF00DCC5C000DEC9C300DBE4D60057E27F006AFF9D0055E17C002AA43C009CC4
      9400FCF8F2009B7C6B00000000000000000000000000A36E6E00F7DAD100FFF6
      E000A4AEEA00FFF4E0004EBB720062FF960052E17B001E9C3300007705000000
      000000000000000000000000000000000000BD4C0000FFFFFF00145C8C00319F
      FC0035A3FF00157BB60084C1ED00FFFFFF00A74605009A6B6A00EFAAA9008C6D
      73002180A3000C98BD000C98BD00000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A00000000000000000000000000AF8F8000FFFF
      FF00FEFEFE00FEFEFE00FEFDFD00D1F8DC0054EE830068FF9B0050DC7700249E
      3800B7DCB600B69F9400000000000000000000000000AA747400FBE5DF00FFFD
      EF00A8B7F500FFFBF50099D9A4003BDC6C0064FE96004DDA74001E962F00037E
      090000000000000000000000000000000000BD4C0000FFFFFF00004B8200319F
      FC00319FFC00004B8200C9E0EB00FFFFFF00BC4B0000DDCFC9009E5C56002D84
      A70007BCED00008EDE00000F9500000081000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000000000000AF8F8000FFFF
      FF00DFCECC00DFCDCB00DECAC600E9D9D500ADEAB9005AF6880064FF970042DA
      690034873E00C6BDB600000000000000000000000000B07B7B00FDECE900FFFF
      F400AABAF500FFF8E900FFF4EE0064CF86004AE7790063FB950049D36C001690
      2500007F0500000000000000000000000000BD4C0000FFFFFF00D8E6EF00004B
      8200004B82005896B800F0F6F800FFFFFF00BC4B0000FFFFFF00D7C2BC00068F
      C1000196DE000320BA000318B200010B99000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000B1908000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFD0091EFAC0055FC88009AC1
      A400CDBBB6006E6D8C00030FB4000000000000000000B8838400FFECDF00FFFA
      E200B0BBEE00FFF8DF00FFF2E000FFEFDF004BCD710055F386005DFE90005BA1
      69006E6E670079776E000000000000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFF8
      F2000263BF002F45ED001031D300010A9500000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000B7978700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFDFB00FBFCFA00A5C5A600FFFF
      FF007892F500203DDC0000029F000000000000000000C28B8B00E4DDDF00E2E4
      E300A8B3D600B3B4B300A1A2A300A6A2A400ACAEAD0025C056008ABF9900DFD4
      D2006A77C1001624B5000206A90000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFFF
      FF00EEEFEF002732D0000C19B40000000000000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFD00FEFCFA00FDFBF900DED0C9008C99
      DE004277FF002D4AD80001029E000000000000000000C8919100C4B9B800817E
      810069656C006D626100908080008A78780088707100455F4B00D5CCC7007992
      F3003862F2001F36C7000000990000000000BC4B0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3938400C1B9
      D0003243C700090FA60000009400000000000000000093717100967575005A53
      530052505000565454005653530054555500595A5A005554520094A0DE002B50
      E600436CF4001625B800000098000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B000000000000000000000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000B8988800B898
      8800B4938300B4938300B08E7D00B08E7D00AC887700AC887700A7827000BCA0
      92000000000000000000000000000000000000000000808282005C5F5F005E5E
      5E006262620062626200606060005C5C5C006B6B6B0000000000000000001522
      C1000D15AA000000980000009900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000314B6200AC7D7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D79000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F59E1001A57CA003767BF00415B9F001344B4000000
      0000000000000000000000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B00000000000000000000000000000000000000
      0000004B00000E9D1D000E9D1D00004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000037A4FE00379FFF000E6D
      DE00355F8900BB7F790000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000317BEB005D8CD1009EA7B700C5B4AA00DEAB8B00F0995B00A4908C002358
      C200000000000000000000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B0000000000000000000000000000000000004B
      00001CB1350011A422000E9D1D0011A42200004B000000000000000000000000
      000000000000000000000000000000000000000000000000000037A4FE00359E
      FF000F6FDE0035608B00A67B7F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001676FF005F98
      E300FAD3A300FFD7A500FFDDA700FFD1A300E6A47800D9834F00FCC08B00E9D4
      C2005F8BD7001E60D80000000000000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B00000000000000000000000000004B00002EC6
      520024BC430013922400004B00000D931A000E9D1D00004B0000000000000000
      00000000000000000000000000000000000000000000000000000000000038A5
      FE00329DFF00156DCE00444F5B00000000009C6B6500AF887B00AF887E00AA80
      75000000000000000000000000000000000000000000000000002A68B800CAB7
      9E00FFEAC600FEE6C700FCE2C500EFC9AB00DA926800E69D6900F8D5B400FFEA
      D400FFFAEB00A6C5EF002D75E900000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000004B000035CA5E0039D4
      65001CA13400004B000000000000004B00000A8615000E9D1D00004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B000000000000000000000000001C76FF00AB753D00FFDD
      A100FEF4EA00FEF3E300FAE5D300E9BC9F00D4805100EAAC8100FCE6CF00FFF3
      E900FFFAF600FFFFFF0099B6E300135DE0000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B00000000000000000000000000004B000029B5
      4800004B000000000000000000000000000000000000004B00000D931A00004B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D1009969650000000000000000001A6AC7006EB45900FFF6
      E600FFFAF400FFFAF300F7E0D000E0A58400E1966600F3CCAD00B5B0A900DAD5
      D000FEFEFC00FFFFFE00B69193002A69D1000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B0000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000004B00000A86
      1500004B00000000000000000000000000000000000000000000000000000000
      00000000000000000000B0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B69384000000000000000000186F750062D18800FFFF
      FF00FFFEFB00FEFBF700EFD0BC00D9916800E39F7300FEE5D000F3EDE500BABB
      B800C2C4C100F4F0EF00807AA1002378FA000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000000000000000000000000000000000
      000000000000B0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B730000000000093BC200C0D5EE00FFFF
      FF00FFFFFF00FEFCFA00E7CABC00DA976D00F2C09800E1D8CF00FBF6F200FFFF
      FF00EAE9E700A1C7F7002378FA00000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      000000000000B18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E75001864E3001F42EF00FFFFFF00D8EA
      FF00A7CFFF0080B7FF003289FF005C96E500D5D7DC00D3CBC000B4B4B100E0E0
      E000FFFFFF00569EFF001673FF00000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C001B75FF00398AFF004D99FF00589F
      FF00000000000000000000000000000000001974FF009DCAFF00EDEDEB00D5CE
      C000CEE2F800287FFF0000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001974FF00ADD3
      FF005BA0FE001873FF0000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001974FF000000000000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000098686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A77E7000A9807300A478
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F785100BB86
      7F00B7827800B7807600B67F7300B67E7100B57D6E00B57D6E00B57D6E00B57D
      6E00B67D6E00B5856900BA479100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1946600FFEA
      C600F8DCB100F5D8A700F4D19B00F3CD9100F0C68400EFC58000EFC58100EFC5
      8100F0C68100F3D37D00B1458A0000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A46769000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A46769008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B00000000000000000000000000000000009F926700FBE8
      CC00F2D8B800F1D2AE00EFCFA400EECA9B00EEC69000ECC18600E8BC7D00E8BC
      7E00E8BE7F00ECCB7A00B1448A0000000000A4676900FCEACE00F0D8BA00DCC1
      A000C4AA8900BFA48000CFAF8200DCB58100E2B87E00E7BC7E00E9BD7F00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A4676900FCEACE00F3DA
      BC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD7F00E9BD
      7F00EFC4810080504B00000000000000000000000000000000009F936A00FCEC
      D500F4DDC000F1D7B600F3D3AE00F0CCA400E9C19400E5BD8B00E8BD8300E9BD
      7E00E9BE7F00EDCB7B00B1448A0000000000A0675B00FEEFDA00F6E0C600302D
      2D00212527003745460099846800AD926F00C2A07400DCB27A00E7BC7E00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B70000000000000000000000000000000000A0675B00FEEFDA00F6E0
      C600F2DABC00F2D5B200C1C188000070000000700000BDB67200E9BD8200E9BD
      7F00EFC4810080504B0000000000000000000000000000000000A2976E00FFF4
      E400F5E2CD00F8E2C700DCCBA70080845D00676D460096866300E7BF8C00EDC1
      8700E9BE7E00EDCB7A00B1448A0000000000A0675B00FFF4E500F7E5CF009C8F
      80000D466300036292000B3B54004B474100917B5E00B5976C00D1AB7400E9BF
      7D00A467690000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000A0675B00FFF4E500F7E5
      CF0000700000C4CA970000700000C2C18700C0BD800000700000BDB66F00EABF
      8100EFC4800080504B0000000000000000000000000000000000A89D7400FFF9
      ED00FBE9D800FFE6D500A2A68100005D0000006300006C704A00E6BC9300E6BE
      8C00E9BE8200EDCA7A00B1448A0000000000A7756B00FFFBF000F8EADC00EEDD
      CA0022576C00165E8200745D65007D5254005E3F390086725800A78C6600CEAA
      7300A06567000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFBF000F8EA
      DC000070000000700000C4C99800F2D5B100F0D0A900BFBD800000700000EBC2
      8A00EFC5830080504B0000000000000000000000000000000000B1A47A00FFFF
      FF00E1DFCE00879073004B5D390000850D0000820900465730006C6F49009686
      6200E4BC8A00EECE8200B144890000000000A7756B00FFFFFC00FAF0E600F8EA
      DA008F9F9D0062555D00DD908C00B87979008E5757005B3D37007D6B51009A81
      5D00925C5E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFFFC00FAF0
      E600007000000070000000700000F2DABA00F2D5B100F0D0A700EECB9D00EBC7
      9300F2C98C0080504B0000000000000000000000000000000000B6AA7D00FFFF
      FF00AAB89F00007402000D9D250015AB2C000FA1200001880F0000680000676D
      4500EAC29500F1D28D00B2448A0000000000BC826800FFFFFF00FEF7F200FAEF
      E600F0E5D5006B5D6200E9A4A100CF909000B275750087535300583C35007A69
      5000815354000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000006F60000000000000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FEF7
      F200FAEFE600F8EAD900F7E3CF00F6E0C500007000000070000000700000EECC
      9E00F3CE970080504B0000000000000000000000000000000000BDB18000FFFF
      FF00ABBEA700007604000FA12B0020BE40001AB23400058F1600006700008084
      5A00F1CDA300F4D99700B3468B0000000000BC826800FFFFFF00FFFEFC00FCF6
      F000FAEFE600EBDCCE008C5E5D00E2A1A100CE8F8F00B4767600865252005C3F
      3800764C4E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000006F600000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FFFE
      FC0000700000CADABA00F7EADA00F6E3CF00C5CE9F000070000000700000F0D0
      A600F6D3A00080504B0000000000000000000000000000000000C3B38100FFFF
      FF00E9F0EA00B2C2AD00778A690013A6330013A73300495B3700A2A37E00DCCB
      A600F9D8AF00E8D29A00A5428A0000000000D1926D00FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500E1CEC00087595800E1A1A100CC8E8E00B07474008651
      5100633B3C000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000005B70000000000000000000006F6000006F6000000
      00000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00CEE7CC0000700000CADAB800C9D7B00000700000C6CC9E0000700000F4D8
      B100EBCFA40080504B0000000000000000000000000000000000CABB8200FFFF
      FF00FFFFFF00FFFFFF00B1C1AC00007C0C00007F1000878F7100FFECDA00FFEC
      CF00CEBEA500A1A183009E428B0000000000D1926D00FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500D7C1B5008A5B5B00E6A6A600CA8B8B00B675
      75007E4442003E41450000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F60000000000000000000006F6000006F6000006
      F6000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00FFFFFF00CEE7CC000070000000700000C9D5B000F8E7D100FBEACE00DECE
      B400B6AA930080504B0000000000000000000000000000000000D0BE8500FFFF
      FF00FFFFFF00FFFFFF00E9F0EA00AABDA600A8B69B00E6E4D200E2C4B400A77C
      72008D6D6B008D756600AC4A840000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600CFB5AA0097666600EFAAA9008C6D
      73001E799F000C98BD000C98BD000000000000000000000000000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000006
      F6000006F60000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900A0675B00A067
      5B00A0675B00A0675B0000000000000000000000000000000000D7C58700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC969000C88E
      6200F3A23F00E1981400D02BC20000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00955F56009E5D58002D84
      A70006BBF000008EDE00000F950000008100000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00A0675B00E19E
      5500E68F3100B56D4D0000000000000000000000000000000000DAC78900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C09E9A00D39A
      6800E2B03B00CA3CA8000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00D1914F00068F
      C1000393DE000320BA000318B200010B9900000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A0675B00F8B5
      5C00BF7A5C000000000000000000000000000000000000000000D5D07900F9FF
      EA00F6FEE100F4FDE100F3FCE000F2FBDF00EFFADF00F4FFE800BAA88F00BA9D
      4B00CE20C400000000000000000000000000E7AB7900FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C1836C000000
      00000263BF002F45ED001031D300010A9500000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FBF4F000FBF4
      EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A0675B00C183
      6C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F00000000000000
      0000000000002732D0000C19B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800A0675B000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF81F000092490000E0070000
      92490000C0030000FFFF0000800100009E790000800100009E79000000000000
      FFFF00000000000092490000000000009249000000000000FFFF000000000000
      9E790000000000009E79000080010000FFFF00008001000092490000C0030000
      92490000E0070000FFFFFFFFF81F0000DC1FDFFFFFFFEFEFC01FDFFFF7FFC7C7
      DC1FDFFFF7FF8383DFFFDFFFF7FF0101DC1FDFFFF7FF8383C01FDFFFF7FFC7C7
      DC1FDFFFF7FFEFEFDFFFDFFFF7FFEFEFDC1FDC1FF7FFE00FC01FC01FF707FEFF
      DC1FDC1FF007F01F07E407E4F707F01F07E007E0C1FFF01F07F107F1C1FFF01F
      FFE0FFE0C1FFF01FFFE4FFE4FFFFF01FFE7FDC1FFFFFDC1FFC67C01FF707C01F
      C407DC1FF007DC1FC007DFFFF707DFFFC007DC1FF7FFDC1FC007C01FF707C01F
      C007DC1FF007DC1FC007DFFFF707DFFFC007DC1FF7FFDC1FC007C01FF707C01F
      C007DC1FF007DC13C00707E1F70707F3C00707E9C1FF07C0C00707E5C1FF07C0
      E00FFFE0C1FFFFF3F81FFFFEFFFFFFF3FFFFFFFFFFFFFF3FFFF19FFF9FFFFE33
      E00107FFC7FFE423C00181FFE1FFC001C003C0FFF0FFC000C007F03FF80FC000
      C00FF80FFC078000C00FFC03FE038001C00FFB03F7038001C00FC38187038000
      C00FC3C183038000C00FC0B381818001C00F818F861FC007C00FF30FE60FE01F
      FFFFF78FF71FC03FFFFFFFBFFF5FEE7FE3FFF33FFFFFFFFFF0FFE007C00380FF
      0001C000C003801F00018001C003801F00010000C003801F00010000C003801F
      00010000C003801F00018000C003800F0001E001C003800F0000F003C0038007
      0000F01FC00180030000E03FC00180010001E03FC00180010001C03FC0018001
      8003C07FC00F8061FFFFF8FFFFFFFFFFFE7FFFFF9FFFFFFFF07FFFFF0FFFFFFF
      C001F9FF07FFFC1FC001F0FF83FFF00FC001E07FC1FFC003C001C03FE10FC001
      C001821FF0038000C001C78FFC018000C001EFC7FC018000C001FFF3F8008001
      C001FFF9F8000001C001FFFFF8000F03C001FFFFFC01FFC3C001FFFFFC01FFF7
      F001FFFFFE03FFFFFC7FFFFFFF8FFFFFC001FFFFFFFFFFFFC0010007FFF98003
      C00100079FF98003C001000787E78003C0010007C7C78003C0010007F11F8003
      C0010007F81F8003C0010007FC7F8003C0010007F83F8003C0010007F19F8003
      C0010003E18F8003C0010001C7E78003C001000087FF8003C00300009FFF8007
      C00700109FFF800FFFFF0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 547
    Top = 384
    object act_help: TAction
      Caption = 'act_help'
      ShortCut = 112
      OnExecute = act_helpExecute
    end
  end
end
