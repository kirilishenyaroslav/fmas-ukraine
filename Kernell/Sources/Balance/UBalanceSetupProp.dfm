object frmBalanceSetupProp: TfrmBalanceSetupProp
  Left = 317
  Top = 198
  BorderStyle = bsDialog
  Caption = 'frmBalanceSetupProp'
  ClientHeight = 378
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 169
    Align = alTop
    TabOrder = 0
    object TextEdit_BalanceSetupName: TcxTextEdit
      Left = 8
      Top = 25
      Width = 545
      Height = 21
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 0
    end
    object LLineCode: TcxLabel
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 9
    end
    object LFormula: TcxLabel
      Left = 8
      Top = 130
      Width = 65
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 10
      Caption = #1060#1086#1088#1084#1091#1083#1072
    end
    object LBalanceSetupName: TcxLabel
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 11
    end
    object CheckBox_root: TcxCheckBox
      Left = 351
      Top = 48
      Width = 121
      Height = 21
      AutoSize = False
      ParentColor = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBox_rootPropertiesChange
      TabOrder = 4
      Visible = False
    end
    object Button_plusSch: TcxButton
      Left = 1
      Top = 148
      Width = 19
      Height = 19
      Caption = '+'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = act_plusSchExecute
    end
    object Button_minusSch: TcxButton
      Left = 20
      Top = 148
      Width = 19
      Height = 19
      Caption = '--'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsStrikeOut]
      ParentFont = False
      TabOrder = 6
      OnClick = act_minusSchExecute
    end
    object Button_DelSch: TcxButton
      Left = 39
      Top = 148
      Width = 28
      Height = 19
      Caption = 'Del'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = act_delSchExecute
    end
    object TextEdit_Formula: TcxMaskEdit
      Left = 66
      Top = 147
      Width = 492
      Height = 21
      TabStop = False
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Default'
      Style.Font.Style = []
      TabOrder = 8
    end
    object MaskEdit_LineCode: TcxMaskEdit
      Left = 8
      Top = 64
      Width = 73
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?'
      Properties.MaxLength = 0
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 1
    end
    object RadioGroup_FormulaType: TcxRadioGroup
      Left = 112
      Top = 48
      Width = 233
      Height = 89
      ItemIndex = 0
      Properties.Items = <
        item
        end
        item
        end
        item
        end>
      Properties.OnChange = RadioGroup_FormulaTypePropertiesChange
      TabOrder = 3
      Caption = ''
    end
    object LOrderCode: TcxLabel
      Left = 8
      Top = 88
      Width = 105
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 12
    end
    object MaskEdit_OrderCode: TcxMaskEdit
      Left = 8
      Top = 104
      Width = 73
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?'
      Properties.MaxLength = 0
      Style.StyleController = frmBalance.cxEditStyleController1
      TabOrder = 2
    end
    object CheckBox_no_summ: TcxCheckBox
      Left = 351
      Top = 72
      Width = 121
      Height = 21
      AutoSize = False
      ParentColor = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBox_rootPropertiesChange
      TabOrder = 13
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 340
    Width = 559
    Height = 38
    Align = alBottom
    TabOrder = 2
    object Button_OK: TcxButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = 'act_OK'
      Default = True
      TabOrder = 0
      OnClick = act_OKExecute
    end
    object Button_Cancel: TcxButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = 'act_Cancel'
      TabOrder = 1
      OnClick = act_CANCELExecute
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 169
    Width = 559
    Height = 171
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource_Sch
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = frmBalance.cxStyle1
      Styles.Content = frmBalance.cxStyle1
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = '+/-'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 20
        DataBinding.FieldName = 'sch_sign'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091
        MinWidth = 90
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 90
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1091
        MinWidth = 200
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Moving = False
        Width = 200
        DataBinding.FieldName = 'SCH_TITLE'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Visible = False
        MinWidth = 100
        Width = 100
        DataBinding.FieldName = 'ID_SCH'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet
    Left = 304
    Top = 200
  end
  object pFIBDataSet: TpFIBDataSet
    Database = frmBalance.DB
    Transaction = frmBalance.ReadTransaction
    UpdateTransaction = frmBalance.WriteTransaction
    Left = 272
    Top = 200
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_Sch: TpFIBDataSet
    Database = frmBalance.DB
    Transaction = frmBalance.ReadTransaction
    UpdateTransaction = frmBalance.WriteTransaction
    Left = 440
    Top = 88
    poSQLINT64ToBCD = True
  end
  object DataSource_Sch: TDataSource
    DataSet = pFIBDataSet_Sch
    Left = 472
    Top = 88
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 368
    Top = 128
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
  end
  object pFIBQuery: TpFIBQuery
    Database = frmBalance.DB
    Transaction = frmBalance.WriteTransaction
    Left = 440
    Top = 120
  end
  object ActionList1: TActionList
    Left = 232
    Top = 168
    object act_OK: TAction
      Caption = 'act_OK'
      ShortCut = 13
      OnExecute = act_OKExecute
    end
    object act_Cancel: TAction
      Caption = 'act_Cancel'
      ShortCut = 27
      OnExecute = act_CANCELExecute
    end
    object act_delSch: TAction
      Caption = 'act_delSch'
      ShortCut = 46
      OnExecute = act_delSchExecute
    end
    object act_PlusSch: TAction
      Caption = 'act_PlusSch'
      ShortCut = 16429
      OnExecute = act_plusSchExecute
    end
    object act_MinusSch: TAction
      Caption = 'act_MinusSch'
      ShortCut = 16430
      OnExecute = act_minusSchExecute
    end
  end
end
