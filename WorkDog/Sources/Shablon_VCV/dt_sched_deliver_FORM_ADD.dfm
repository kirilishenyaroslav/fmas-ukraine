object Fdt_sched_deliver_ADD: TFdt_sched_deliver_ADD
  Left = 251
  Top = 188
  BorderStyle = bsDialog
  ClientHeight = 218
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 200
    Top = 8
    Width = 61
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1094#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 408
    Top = 8
    Width = 52
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103':'
  end
  object Label13: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 13
    Caption = #1058#1086#1095#1082#1072' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 8
    Top = 188
    Width = 98
    Height = 13
    Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091' '#1074#1072#1088#1090#1086#1089#1090#1110
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 232
    Width = 153
    Height = 113
    TabOrder = 0
    Visible = False
    object Label7: TLabel
      Left = 16
      Top = 16
      Width = 89
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1054#1087#1083#1072#1095#1077#1085#1080#1081' '#1086#1073#39#1108#1084':'
      ParentBiDiMode = False
    end
    object Label8: TLabel
      Left = 16
      Top = 64
      Width = 101
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1055#1086#1089#1090#1072#1074#1083#1077#1085#1080#1081' '#1086#1073#39#1108#1084':'
      ParentBiDiMode = False
    end
    object VolPayEdit: TEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      Color = clInfoBk
      TabOrder = 0
      Text = '0'
    end
    object VolFulfilEdit: TEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      Color = clInfoBk
      TabOrder = 1
      Text = '0'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 48
    Width = 289
    Height = 121
    Caption = #1044#1086#1075#1086#1074#1110#1088
    TabOrder = 1
    object Label4: TLabel
      Left = 152
      Top = 16
      Width = 33
      Height = 13
      Caption = #1058#1072#1088#1080#1092
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 91
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 152
      Top = 64
      Width = 24
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1055#1044#1042
      ParentBiDiMode = False
    end
    object UMeasEdit1: TcxButtonEdit
      Left = 80
      Top = 32
      Width = 57
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = UMeasEdit1ButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object CountEdit: TcxTextEdit
      Left = 16
      Top = 32
      Width = 57
      Height = 21
      BeepOnEnter = False
      Properties.OnChange = CostEditChange
      Style.Color = clMoneyGreen
      TabOrder = 1
      Text = '0'
      OnKeyPress = CountEditKeyPress
    end
    object CostEdit: TcxTextEdit
      Left = 152
      Top = 48
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.OnChange = CostEditChange
      TabOrder = 2
      Text = '0'
      Visible = False
      OnKeyPress = CostEditKeyPress
    end
    object SummaEdit: TcxTextEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      TabOrder = 3
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
    object SummaNdsEdit: TcxTextEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      TabOrder = 4
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
    object StrCostEdit: TcxTextEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.OnChange = CostEditChange
      TabOrder = 5
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 304
    Top = 48
    Width = 289
    Height = 121
    Caption = #1055#1083#1072#1085
    TabOrder = 2
    object Label9: TLabel
      Left = 152
      Top = 16
      Width = 33
      Height = 13
      Caption = #1058#1072#1088#1080#1092
    end
    object Label11: TLabel
      Left = 16
      Top = 64
      Width = 91
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      ParentBiDiMode = False
    end
    object Label12: TLabel
      Left = 152
      Top = 64
      Width = 24
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #1055#1044#1042
      ParentBiDiMode = False
    end
    object Label6: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
    end
    object PlanCountEdit: TcxTextEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      BeepOnEnter = False
      Properties.ReadOnly = False
      Properties.OnChange = PlanCountEditChange
      Style.Color = clMoneyGreen
      TabOrder = 0
      Text = '0'
      OnKeyPress = CountEditKeyPress
    end
    object CostEdit2: TcxTextEdit
      Left = 152
      Top = 48
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.OnChange = CostEdit2PropertiesChange
      TabOrder = 1
      Text = '0'
      Visible = False
      OnKeyPress = CostEditKeyPress
    end
    object SummaEdit2: TcxTextEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      TabOrder = 2
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
    object SummaNDSEdit2: TcxTextEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      TabOrder = 3
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
    object StrCostEdit2: TcxTextEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.OnChange = CostEdit2PropertiesChange
      TabOrder = 4
      Text = '0'
      OnKeyPress = CostEditKeyPress
    end
  end
  object CatEdit: TcxTextEdit
    Left = 408
    Top = 24
    Width = 185
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object OKButton: TcxButton
    Left = 408
    Top = 184
    Width = 89
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 504
    Top = 184
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 264
    Width = 585
    Height = 120
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1ID_TYPE_PRODUCT_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_TYPE_PRODUCT_PARAM'
      end
      object cxGrid1DBTableView1ID_PRODUCT_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_PRODUCT_PARAM'
      end
      object cxGrid1DBTableView1ID_CAT_CUST_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_CAT_CUST_PARAM'
      end
      object cxGrid1DBTableView1NAME_TYPE_PRODUCT_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'NAME_TYPE_PRODUCT_PARAM'
      end
      object cxGrid1DBTableView1NAME_PRODUCT_PARAM: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        Width = 242
        DataBinding.FieldName = 'NAME_PRODUCT_PARAM'
      end
      object cxGrid1DBTableView1NAME_CAT_CUST_PARAM: TcxGridDBColumn
        Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        HeaderAlignmentHorz = taCenter
        Width = 230
        DataBinding.FieldName = 'NAME_CAT_CUST_PARAM'
      end
      object cxGrid1DBTableView1NAME_UNIT_MEAS_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'NAME_UNIT_MEAS_PARAM'
      end
      object cxGrid1DBTableView1MAIN_PRODUCT_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'MAIN_PRODUCT_PARAM'
      end
      object cxGrid1DBTableView1NEED_CAT_CUST_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'NEED_CAT_CUST_PARAM'
      end
      object cxGrid1DBTableView1COST_CAN_CHANGE_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'COST_CAN_CHANGE_PARAM'
      end
      object cxGrid1DBTableView1NEED_OBJECTS_PARAM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'NEED_OBJECTS_PARAM'
      end
      object cxGrid1DBTableView1COST_PARAM: TcxGridDBColumn
        Caption = #1062#1110#1085#1072
        HeaderAlignmentHorz = taCenter
        Width = 111
        DataBinding.FieldName = 'COST_PARAM'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PointEdit: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = PointEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 7
  end
  object UMeasEditS: TcxButtonEdit
    Left = 112
    Top = 184
    Width = 81
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 8
  end
  object ProductEdit: TcxButtonEdit
    Left = 200
    Top = 24
    Width = 201
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = ProductEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 9
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = Fdt_contract_ADD.WorkDatabase
    Transaction = Fdt_contract_ADD.ReadTransaction
    SelectSQL.Strings = (
      
        'select * from PROC_SELECT_PRICES_FOR_PLAN_3('#39#39', '#39'01.01.1900'#39', '#39'0' +
        '1.01.3000'#39', '#39'02.03.2003'#39')')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 376
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 344
    Top = 176
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 312
    Top = 176
  end
  object pFIBQuery1: TpFIBQuery
    Database = Fdt_contract_ADD.WorkDatabase
    Transaction = Fdt_contract_ADD.ReadTransaction
    Left = 280
    Top = 176
  end
  object pFIBQuery2: TpFIBQuery
    Database = Fdt_contract_ADD.WorkDatabase
    Transaction = Fdt_contract_ADD.ReadTransaction
    Left = 248
    Top = 176
  end
end
