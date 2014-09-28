object FZDateAcc: TFZDateAcc
  Left = 396
  Top = 286
  Width = 586
  Height = 405
  Caption = 'FZDateAcc'
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
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl2: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 570
    Height = 5
    Align = dalTop
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 347
    Width = 570
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    OnResize = dxStatusBar1Resize
  end
  object DockSite: TdxDockSite
    Left = 0
    Top = 5
    Width = 570
    Height = 342
    Align = alClient
    DockType = 0
    OriginalWidth = 578
    OriginalHeight = 346
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 570
      Height = 342
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
    end
    object DockPanel2: TdxDockPanel
      Left = 0
      Top = 0
      Width = 570
      Height = 342
      AllowFloating = True
      AutoHide = False
      Caption = 'DockPanel2'
      CaptionButtons = []
      Dockable = False
      ShowCaption = False
      DockType = 1
      OriginalWidth = 185
      OriginalHeight = 140
      object Grid3: TcxGrid
        Left = 0
        Top = 0
        Width = 566
        Height = 213
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object Grid3DBBandedTableView1: TcxGridDBBandedTableView
          DataController.DataSource = DSource3
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems.OnSummary = Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'SUMMA'
              Column = Grid3ClSumma
            end>
          DataController.Summary.FooterSummaryItems.OnSummary = Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00;-0.00'
              Kind = skSum
              FieldName = 'summa'
              Column = Grid3ClSumma
            end
            item
              Kind = skCount
              FieldName = 'KOD_VIDOPL'
              Column = Grid3ClVidOpl
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = Grid3DBBandedTableView1FocusedRecordChanged
          OptionsBehavior.CellHints = True
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          OptionsView.BandHeaders = False
          Preview.Place = ppTop
          Preview.Visible = True
          Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
            end>
          object Grid3ClVo: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 31
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_VIDOPL'
            IsCaptionAssigned = True
          end
          object Grid3ClVidOpl: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'NAME_VIDOPL'
            IsCaptionAssigned = True
          end
          object Grid3ClSumma: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUMMA'
            IsCaptionAssigned = True
          end
          object Grid3ClP1: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            Visible = False
            OnGetDisplayText = Grid3ClP1GetDisplayText
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soDescending
            Width = 23
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
            DataBinding.FieldName = 'P1'
            IsCaptionAssigned = True
          end
          object Grid3ClDepartment: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 24
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_DEPARTMENT'
            IsCaptionAssigned = True
          end
          object Grid3ClSmeta: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 20
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_SMETA'
            IsCaptionAssigned = True
          end
          object Grid3ClKodSetup3: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = Grid3ClKodSetup3GetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 40
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_SETUP3'
            IsCaptionAssigned = True
          end
          object Grid3ClReCount: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 20
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'P_OLD'
            IsCaptionAssigned = True
          end
          object Grid3ClNDay: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = Grid3ClNDayGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 25
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
            DataBinding.FieldName = 'NDAY'
            IsCaptionAssigned = True
          end
          object Grid3ClClock: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = Grid3ClClockGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 41
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
            DataBinding.FieldName = 'CLOCK'
            IsCaptionAssigned = True
          end
          object Grid3ClStavkaPercent: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'STAVKA_PERCENT'
            IsCaptionAssigned = True
          end
        end
        object Grid3Level1: TcxGridLevel
          GridView = Grid3DBBandedTableView1
        end
      end
      object PanelGrid3DopData: TPanel
        Left = 0
        Top = 221
        Width = 566
        Height = 117
        Align = alBottom
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        OnResize = PanelGrid3DopDataResize
        object DBMaskEditDepartment: TcxDBMaskEdit
          Left = 61
          Top = 64
          Width = 359
          Height = 21
          DataBinding.DataField = 'NAME_DEPARTMENT'
          DataBinding.DataSource = DSource3
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
        end
        object DBMaskEditSmeta: TcxDBMaskEdit
          Left = 61
          Top = 88
          Width = 359
          Height = 21
          DataBinding.DataField = 'NAME_SMETA'
          DataBinding.DataSource = DSource3
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
        end
        object LabelDepartment: TcxLabel
          Left = 0
          Top = 45
          Width = 60
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 2
        end
        object LabelSmeta: TcxLabel
          Left = 0
          Top = 90
          Width = 60
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 3
        end
        object DBMaskEditPost: TcxDBMaskEdit
          Left = 61
          Top = 2
          Width = 359
          Height = 21
          DataBinding.DataField = 'NAME_POST'
          DataBinding.DataSource = DSource3
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
        end
        object LabelPost: TcxLabel
          Left = 0
          Top = 4
          Width = 60
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 5
        end
        object DBMaskEditCategory: TcxDBMaskEdit
          Left = 61
          Top = 20
          Width = 359
          Height = 21
          DataBinding.DataField = 'NAME_CATEGORY'
          DataBinding.DataSource = DSource3
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
        end
        object LabelCategory: TcxLabel
          Left = -1
          Top = 22
          Width = 60
          Height = 17
          AutoSize = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 7
        end
        object cxDBMaskEdit1: TcxDBMaskEdit
          Left = 60
          Top = 44
          Width = 359
          Height = 21
          DataBinding.DataField = 'kod_department'
          DataBinding.DataSource = DSource3
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 8
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 213
        Width = 566
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salBottom
        Control = PanelGrid3DopData
      end
    end
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 456
    Top = 64
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 456
  end
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 360
    Top = 16
  end
  object DSet3: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)')
    DataSource = DSource2
    AfterOpen = DSet3AfterOpen
    Left = 424
    Top = 64
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DSet1: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_REE_VED_SELECT')
    Left = 424
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 392
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 392
    Top = 32
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 488
    Top = 16
  end
  object Styles: TcxStyleRepository
    Left = 536
    Top = 16
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = 15400938
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
      Color = 8535838
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
    end
  end
  object DSet2: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)')
    DataSource = DSource1
    Left = 424
    Top = 32
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 456
    Top = 32
  end
  object ActionList: TActionList
    Left = 321
    Top = 14
    object ActionSystem: TAction
      Caption = 'ActionSystem'
      ShortCut = 49242
      OnExecute = ActionSystemExecute
    end
  end
end
