object FgrCurrentCtrl: TFgrCurrentCtrl
  Left = 331
  Top = 206
  BorderStyle = bsDialog
  Caption = 'FgrCurrentCtrl'
  ClientHeight = 438
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 336
    Top = 388
    Width = 81
    Height = 25
    Action = Action1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 424
    Top = 388
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxMain: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 44
    Alignment = alTopLeft
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
    object EditMan: TcxDBButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      TabOrder = 0
    end
  end
  object PrikazBox: TcxGroupBox
    Left = 0
    Top = 104
    Width = 553
    Height = 97
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object Bevel2: TBevel
      Left = 7
      Top = 45
      Width = 537
      Height = 1
      Style = bsRaised
    end
    object EditPrikaz: TcxMaskEdit
      Left = 104
      Top = 16
      Width = 441
      Height = 24
      TabOrder = 0
    end
    object LabelPrikaz: TcxLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = 'LabelPrikaz'
    end
    object LabelPeriod: TcxLabel
      Left = 264
      Top = 52
      Width = 121
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = 'LabelPeriod'
    end
    object MonthesList: TcxComboBox
      Left = 383
      Top = 50
      Width = 105
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 2
      OnExit = MonthesListExit
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 485
      Top = 50
      Width = 60
      Height = 24
      Properties.Alignment.Horz = taLeftJustify
      Properties.BeepOnError = True
      Properties.CanEdit = False
      Properties.MaxValue = 2050.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      TabOrder = 3
      Value = 2000
      OnExit = MonthesListExit
    end
    object LabelSumma: TcxLabel
      Left = 8
      Top = 53
      Width = 116
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = 'LabelSumma'
    end
    object EditSumma: TcxMaskEdit
      Left = 128
      Top = 50
      Width = 137
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 1
    end
    object CheckBoxMonthFinish: TcxCheckBox
      Left = 44
      Top = 72
      Width = 497
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'F'
      Properties.ValueUnchecked = 'T'
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
  end
  object IdMovingBox: TcxGroupBox
    Left = 0
    Top = 200
    Width = 553
    Height = 185
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object LabelManMoving: TcxLabel
      Left = 8
      Top = 11
      Width = 537
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'LabelManMoving'
    end
    object Grid1: TcxGrid
      Left = 8
      Top = 32
      Width = 537
      Height = 145
      BorderStyle = cxcbsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      object Grid1DBBandedTableView1: TcxGridDBBandedTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Bands = <
          item
          end
          item
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
          end>
        object GridClKodDepartment: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_DEPARTMENT'
        end
        object GridClNameDepartment: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 329
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object GridClNamePost: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 311
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 1
          DataBinding.FieldName = 'NAME_KAT_STUD'
        end
        object GridClDateBeg: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 79
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'DATE_BEG'
        end
        object GridClDateEnd: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 79
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'DATE_END'
        end
        object GridClKurs: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 68
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 1
          DataBinding.FieldName = 'KURS'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1DBBandedTableView1
      end
    end
  end
  object BoxChild: TcxGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 65
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object EditSmeta: TcxButtonEdit
      Left = 104
      Top = 12
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditSmetaPropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = False
      TabOrder = 0
      OnExit = EditSmetaExit
    end
    object LabelSmeta: TcxLabel
      Left = 0
      Top = 14
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = 'LabelSmeta'
    end
    object LabelSmetaName: TcxLabel
      Left = 171
      Top = 12
      Width = 376
      Height = 25
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clMedGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnHighlight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      TabOrder = 3
      Caption = ''
    end
    object LabelVidOpl: TcxLabel
      Left = 0
      Top = 39
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = 'LabelVidOpl'
    end
    object EditVidOpl: TcxButtonEdit
      Left = 104
      Top = 37
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditVidOplPropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 1
      OnExit = EditVidOplExit
    end
    object LabelVidOplName: TcxLabel
      Left = 171
      Top = 37
      Width = 376
      Height = 24
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clMedGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnHighlight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      TabOrder = 5
      Caption = ''
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 418
    Width = 554
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
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ActionList1: TActionList
    Left = 88
    Top = 368
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'ActionSaveBuffer'
      ShortCut = 120
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 13
      OnExecute = Action3Execute
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 128
    Top = 368
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
      Color = 4707838
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
end
