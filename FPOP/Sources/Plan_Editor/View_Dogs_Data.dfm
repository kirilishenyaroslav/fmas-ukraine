object View_Dogs_DataForm: TView_Dogs_DataForm
  Left = 321
  Top = 278
  Width = 460
  Height = 350
  Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1076#1072#1085#1080#1093' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 452
    Height = 275
    Align = alClient
    TabOrder = 0
    object TableView: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          Column = Name_Cust_Column
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = Plan_Count_Column
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = Deliver_Count_Column
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = dm.GridStyleSheetDevExpress
      object Name_Cust_Column: TcxGridColumn
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 227
      end
      object Plan_Count_Column: TcxGridColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 113
      end
      object Deliver_Count_Column: TcxGridColumn
        Caption = #1044#1086#1075#1086#1074#1110#1088#1085#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 110
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 275
    Width = 452
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object CancelButton: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 0
      OnClick = CancelButtonClick
    end
    object ApplyButton: TcxButton
      Left = 216
      Top = 8
      Width = 147
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1080' '#1087#1083#1072#1085#1086#1074#1091' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
      TabOrder = 1
      OnClick = ApplyButtonClick
    end
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 32
    Top = 280
    poSQLINT64ToBCD = True
  end
end
