object frmEditSch: TfrmEditSch
  Left = 603
  Top = 118
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1110#1079' '#1076#1086#1074#1110#1076#1085#1080#1082#1086#1084' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1073#1072#1083#1072#1085#1089#1091
  ClientHeight = 532
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ConfirmButton: TcxButton
    Left = 377
    Top = 481
    Width = 80
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = ConfirmButtonClick
  end
  object cancelButton: TcxButton
    Left = 461
    Top = 481
    Width = 80
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cancelButtonClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 0
    Width = 577
    Height = 473
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 569
        Height = 444
        Align = alTop
        TabOrder = 0
        object Bevel1: TBevel
          Left = 16
          Top = 25
          Width = 545
          Height = 410
        end
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 567
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' '#1073#1072#1083#1072#1085#1089#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 40
          Top = 72
          Width = 174
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 32
          Top = 44
          Width = 182
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1058#1080#1087' '#1086#1073#39#1108#1082#1090#1091' '#1073#1072#1083#1072#1085#1089#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 37
          Top = 105
          Width = 177
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1072' '#1088#1086#1073#1086#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 53
          Top = 133
          Width = 161
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1050#1086#1076' '#1086#1073#39#1108#1082#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label7: TLabel
          Left = 21
          Top = 164
          Width = 193
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1058#1080#1087' '#1086#1073#39#1108#1082#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label5: TLabel
          Left = 21
          Top = 202
          Width = 120
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1060#1086#1088#1084#1072' '#1086#1073#1083#1110#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 22
          Top = 234
          Width = 123
          Height = 33
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1054#1073#1083#1110#1082#1086#1074#1080#1081' '#1088#1077#1075#1110#1089#1090#1088' '#1086#1073#1083#1110#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object CheckChangeOperLinks: TLabel
          Left = 48
          Top = 355
          Width = 503
          Height = 32
          AutoSize = False
          Caption = 
            #1055#1088#1080' '#1079#1084#1110#1085#1110' '#1087#1088#1080#1074#39#1103#1079#1082#1080' '#1076#1086' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072' '#1085#1072' '#1088#1072#1093#1091#1085#1082#1091' '#1072#1074#1090#1086#1084#1072#1090#1080#1095 +
            #1085#1086' '#1079#1084#1110#1085#1102#1074#1072#1090#1080' '#1087#1088#1080#1074#39#1103#1079#1082#1080' '#1085#1072' '#1086#1087#1077#1088#1072#1094#1110#1103#1093', '#1074' '#1103#1082#1080#1093' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1088#1072#1093 +
            #1091#1085#1086#1082
          Visible = False
          WordWrap = True
        end
        object EdTitle: TEdit
          Left = 217
          Top = 72
          Width = 336
          Height = 22
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object EdObjKod: TEdit
          Left = 217
          Top = 133
          Width = 336
          Height = 19
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object meDateBeg: TMaskEdit
          Left = 217
          Top = 104
          Width = 64
          Height = 22
          Color = clInfoBk
          Ctl3D = False
          EditMask = '!99/0000;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Text = '  .    '
        end
        object cxRadioGroup1: TcxRadioGroup
          Left = 38
          Top = 269
          Width = 516
          Height = 81
          ItemIndex = 0
          ParentFont = False
          Properties.Items = <
            item
              Caption = #1058#1110#1083#1100#1082#1080' '#1085#1072' '#1086#1073#39#1108#1082#1090', '#1097#1086' '#1088#1077#1076#1072#1075#1091#1108#1090#1100#1089#1103
            end
            item
              Caption = #1053#1072' '#1086#1073#39#1108#1082#1090', '#1097#1086' '#1088#1077#1076#1072#1075#1091#1108#1090#1100#1089#1103' + '#1085#1072' '#1076#1086#1095#1110#1088#1085#1110' '#1086#1073#39#1108#1082#1090#1080' 1 '#1088#1110#1074#1085#1103
            end
            item
              Caption = #1053#1072' '#1074#1089#1110' '#1076#1086#1095#1110#1088#1085#1110' '#1086#1073#39#1108#1082#1090#1080
            end>
          TabOrder = 3
          Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1079#1084#1110#1085#1080
        end
        object dbcbObjectType: TcxLookupComboBox
          Left = 216
          Top = 42
          Width = 338
          Height = 24
          Properties.KeyFieldNames = 'ID_SP_SCH_OBJ_TYPE'
          Properties.ListColumns = <
            item
              Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072' '#1073#1072#1083#1083#1072#1085#1089#1072
              FieldName = 'SCH_OBJ_TYPE_TITLE'
            end>
          Properties.ListSource = ObjectTypeDataSource
          Style.Color = clInfoBk
          TabOrder = 4
        end
        object dbcbSchType: TcxLookupComboBox
          Left = 216
          Top = 161
          Width = 338
          Height = 24
          Properties.KeyFieldNames = 'ID_SCH_TYPE'
          Properties.ListColumns = <
            item
              Caption = #1058#1080#1087' '#1089#1095#1077#1090#1072
              FieldName = 'SCH_TYPE_TITLE'
            end>
          Properties.ListSource = SchTypeDataSource
          Style.Color = clInfoBk
          TabOrder = 5
        end
        object SysReg: TcxLookupComboBox
          Left = 150
          Top = 197
          Width = 405
          Height = 24
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID_SYSTEM'
          Properties.ListColumns = <
            item
              Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1072#1103' '#1092#1086#1088#1084#1072' '#1091#1095#1077#1090#1072
              FieldName = 'SYSTEM_TITLE'
            end>
          Properties.ListSource = frmSchMain.SysSource
          Properties.OnChange = SysRegPropertiesChange
          Style.Color = clInfoBk
          TabOrder = 6
        end
        object dbcbReg: TcxLookupComboBox
          Left = 150
          Top = 234
          Width = 406
          Height = 24
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID_REG'
          Properties.ListColumns = <
            item
              Caption = #1056#1077#1075#1080#1089#1090#1088' '#1091#1095#1077#1090#1072
              FieldName = 'REG_TITLE'
            end>
          Properties.ListSource = RegDataSource
          Style.Color = clInfoBk
          TabOrder = 7
        end
        object CheckChangeOperDBLinks: TcxCheckBox
          Left = 41
          Top = 391
          Width = 144
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.MultiLine = True
          Properties.Caption = #1088#1072#1093#1091#1085#1086#1082' '#1074' '#1076#1077#1073#1077#1090#1110
          TabOrder = 8
          Visible = False
        end
        object CheckChangeOperKrLinks: TcxCheckBox
          Left = 41
          Top = 415
          Width = 144
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.MultiLine = True
          Properties.Caption = #1088#1072#1093#1091#1085#1086#1082' '#1074' '#1082#1088#1077#1076#1080#1090#1110
          TabOrder = 9
          Visible = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1077#1088#1110#1086#1076#1080' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 569
        Height = 442
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = cxGrid1DBTableView1DblClick
          DataController.DataSource = EditDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = cxStyle1
          Styles.Content = cxStyle1
          Styles.Header = cxStyle4
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 159
            DataBinding.FieldName = 'DATE_BEG'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 137
            DataBinding.FieldName = 'DATE_END'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #1050#1086#1088#1077#1075#1091#1074#1072#1090#1080
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 133
            DataBinding.FieldName = 'MAY_EDIT'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 512
    Width = 581
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Enter (F10)  -  '#1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Esc  -  '#1042#1110#1076#1084#1110#1085#1080#1090#1080
        Width = 100
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object SchTypeDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PUB_SP_SCH_TYPE')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 24
    Top = 152
    poSQLINT64ToBCD = True
  end
  object SchTypeObjDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PUB_SP_SCH_OBJ_TYPE')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 24
    Top = 40
    poSQLINT64ToBCD = True
  end
  object ObjectTypeDataSource: TDataSource
    DataSet = SchTypeObjDataSet
    Left = 56
    Top = 40
  end
  object SchTypeDataSource: TDataSource
    DataSet = SchTypeDataSet
    Left = 56
    Top = 152
  end
  object ActionList1: TActionList
    Left = 408
    Top = 8
    object cancelAction: TAction
      Caption = 'cancelAction'
      ShortCut = 27
      OnExecute = cancelActionExecute
    end
    object Enter: TAction
      Caption = 'Enter'
      ShortCut = 13
      OnExecute = EnterExecute
    end
    object ConfirmAction: TAction
      Caption = 'ConfirmAction'
      ShortCut = 121
      OnExecute = ConfirmActionExecute
    end
  end
  object RegDataSet: TpFIBDataSet
    DataSource = frmSchMain.SysSource
    Left = 56
    Top = 88
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object RegDataSource: TDataSource
    DataSet = RegDataSet
    Left = 24
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 24
    Top = 192
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10930928
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 4707838
    end
  end
  object EditPeriodsDataSet: TpFIBDataSet
    Database = frmSchMain.WorkDatabase
    Transaction = frmSchMain.ReadTransaction
    Left = 20
    Top = 227
    poSQLINT64ToBCD = True
  end
  object EditDataSource: TDataSource
    DataSet = EditPeriodsDataSet
    Left = 52
    Top = 227
  end
end
