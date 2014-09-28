inherited FormPRK_SP_PLAN_CEL_NABOR: TFormPRK_SP_PLAN_CEL_NABOR
  Left = 244
  Top = 157
  Width = 666
  Height = 496
  Caption = 'FormPRK_SP_PLAN_CEL_NABOR'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKVuzLicense: TcxGrid
    Left = 416
    Top = 232
    Width = 129
    Height = 181
    Align = alNone
    Visible = False
    inherited cxGridPrKVuzLicenseDBTableView1: TcxGridDBTableView
      DataController.DataSource = nil
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
    end
  end
  inherited dxStatusBarVL: TdxStatusBar
    Top = 449
    Width = 658
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end>
  end
  object cxGroupBoxPlanNabora: TcxGroupBox [2]
    Left = 0
    Top = 40
    Width = 343
    Height = 409
    Align = alClient
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPlanNabora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    object cxGridPrKPlanNabora: TcxGrid
      Left = 2
      Top = 15
      Width = 339
      Height = 252
      Align = alClient
      TabOrder = 0
      object cxGridPrKPlanNaboraDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourcePrKVuzLicense
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colSHORT_NAME_FAK: TcxGridDBColumn
          Width = 105
          DataBinding.FieldName = 'SHORT_NAME_FAK'
        end
        object colNAME_CN_FACUL_SPEC: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 105
          DataBinding.FieldName = 'SHORT_NAME_SPEC'
        end
        object colSHORT_NAME_CN_KAT_STUD: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 86
          DataBinding.FieldName = 'SHORT_NAME_KAT_STUD'
        end
        object colSHORT_NAME_CN_FORM_STUD: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 85
          DataBinding.FieldName = 'SHORT_NAME_FORM_STUD'
        end
      end
      object cxGridPrKPlanNaboraLevel1: TcxGridLevel
        GridView = cxGridPrKPlanNaboraDBTableView1
      end
    end
    object cxGroupBoxPlanNaborDopData: TcxGroupBox
      Left = 2
      Top = 267
      Width = 339
      Height = 140
      Align = alBottom
      Alignment = alTopLeft
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      TabStop = False
      object cxDBTextEditDateBegCodNab: TcxDBTextEdit
        Left = 144
        Top = 116
        Width = 111
        Height = 21
        TabStop = False
        DataBinding.DataField = 'DATE_BEGIN_GOD'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object cxDBTextEditDateEndGodNab: TcxDBTextEdit
        Left = 259
        Top = 116
        Width = 111
        Height = 21
        TabStop = False
        DataBinding.DataField = 'DATE_END_GOD'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 1
      end
      object cxLabelDateBeg: TcxLabel
        Left = 145
        Top = 97
        Width = 107
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
      object cxLabelDateEnd: TcxLabel
        Left = 259
        Top = 97
        Width = 111
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
      object cxLabelGodNabora: TcxLabel
        Left = 4
        Top = 97
        Width = 143
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
      object cxDBTextEditGodNabora: TcxDBTextEdit
        Left = 4
        Top = 116
        Width = 136
        Height = 21
        TabStop = False
        DataBinding.DataField = 'SHORT_NAME_GOD'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 5
      end
      object cxLabelDergZakaz: TcxLabel
        Left = 6
        Top = 31
        Width = 175
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
      end
      object cxDBTextEditDergZakaz: TcxDBTextEdit
        Left = 184
        Top = 31
        Width = 187
        Height = 21
        TabStop = False
        DataBinding.DataField = 'SHORT_NAME_ZAKAZ'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 7
      end
      object cxLabelPlanValue: TcxLabel
        Left = 6
        Top = 9
        Width = 176
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
      end
      object cxDBTextEditPlanValue: TcxDBTextEdit
        Left = 184
        Top = 8
        Width = 186
        Height = 21
        TabStop = False
        DataBinding.DataField = 'PLAN_VALUE'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.Color = clInfoBk
        TabOrder = 9
      end
      object cxLabelKurs: TcxLabel
        Left = 6
        Top = 54
        Width = 175
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 10
      end
      object cxDBTextEditKurs: TcxDBTextEdit
        Left = 184
        Top = 54
        Width = 187
        Height = 21
        TabStop = False
        DataBinding.DataField = 'SHORT_NAME_KURS'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 11
      end
      object cxLabelSrokOb: TcxLabel
        Left = 6
        Top = 77
        Width = 175
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 12
      end
      object cxDBTextEditSrokOb: TcxDBTextEdit
        Left = 184
        Top = 77
        Width = 187
        Height = 21
        TabStop = False
        DataBinding.DataField = 'SHORT_NAME_SROK_OB'
        DataBinding.DataSource = DataSourcePrKVuzLicense
        Style.Color = clInfoBk
        TabOrder = 13
      end
    end
  end
  object cxGroupBoxPlanSelNabor: TcxGroupBox [3]
    Left = 351
    Top = 40
    Width = 307
    Height = 409
    Align = alRight
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPlanSelNabor'
    TabOrder = 7
    object dxBarDockControl1: TdxBarDockControl
      Left = 2
      Top = 15
      Width = 303
      Height = 72
      Align = dalTop
      BarManager = dxBarManagerVuzLicense
    end
    object cxGridPrKCelPlanNabora: TcxGrid
      Left = 2
      Top = 87
      Width = 303
      Height = 320
      Align = alClient
      TabOrder = 1
      object cxGridPrKCelPlanNaboraDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceCelPlanNabora
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colSHORT_NAME_CEL_ZAMOV: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 209
          DataBinding.FieldName = 'SHORT_NAME_ZAMOVNIK'
        end
        object colPLAN_VALUE: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 92
          DataBinding.FieldName = 'PLAN_VALUE'
        end
      end
      object cxGridPrKCelPlanNaboraLevel1: TcxGridLevel
        GridView = cxGridPrKCelPlanNaboraDBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter [4]
    Left = 343
    Top = 40
    Width = 8
    Height = 409
    Cursor = crHSplit
    AlignSplitter = salRight
    Control = cxGroupBoxPlanSelNabor
  end
  inherited ActionListVuzLicense: TActionList
    inherited ActionADD: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionChange: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionDEL: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionView: TAction
      Enabled = False
      Visible = False
    end
    inherited ActionVibrat: TAction
      Enabled = False
      Visible = False
    end
    object ActionAddCelPN: TAction
      Caption = 'ActionAddCelPN'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = ActionAddCelPNExecute
    end
    object ActionChangeCelPN: TAction
      Caption = 'ActionChangeCelPN'
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = ActionChangeCelPNExecute
    end
    object ActionDelCelPN: TAction
      Caption = 'ActionDelCelPN'
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = ActionDelCelPNExecute
    end
    object ActionViewCelPN: TAction
      Caption = 'ActionViewCelPN'
      ImageIndex = 10
      ShortCut = 16498
      OnExecute = ActionViewCelPNExecute
    end
  end
  inherited dxBarManagerVuzLicense: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButtonAdd
            Visible = True
          end
          item
            Item = dxBarLargeButtonChange
            Visible = True
          end
          item
            Item = dxBarLargeButtonDel
            Visible = True
          end
          item
            Item = dxBarLargeButtonView
            Visible = True
          end
          item
            Item = dxBarLargeButtonVibrat
            Visible = True
          end
          item
            Item = dxBarLargeButtonObnov
            Visible = True
          end
          item
            Item = dxBarLargeButtonOtmena
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'PlanSelNabor'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end>
        MultiLine = True
        Name = 'PlanSelNabor'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 408
    Top = 168
    DockControlHeights = (
      0
      0
      40
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionAddCelPN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionChangeCelPN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionDelCelPN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionViewCelPN
      Category = 0
      AutoGrayScale = False
    end
  end
  object DataSourceCelPlanNabora: TDataSource
    DataSet = DataSetCelPlanNabora
    Left = 473
    Top = 168
  end
  object DataSetCelPlanNabora: TpFIBDataSet
    DataSource = DataSourcePrKVuzLicense
    Left = 441
    Top = 168
    poSQLINT64ToBCD = True
  end
end
