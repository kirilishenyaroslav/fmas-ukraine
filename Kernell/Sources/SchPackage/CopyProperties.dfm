object frmCopyProp: TfrmCopyProp
  Left = 256
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1050#1086#1087#1110#1102#1074#1072#1085#1085#1103' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1077#1081' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 384
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 81
    Align = alTop
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 6
      Top = 5
      Width = 139
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      Caption = #1064#1072#1073#1083#1086#1085#1085#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
    end
    object cxLabel2: TcxLabel
      Left = 6
      Top = 58
      Width = 243
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Caption = #1056#1072#1093#1091#1085#1082#1080' '#1076#1083#1103' '#1079#1072#1089#1090#1086#1089#1091#1074#1072#1085#1085#1103' '#1096#1072#1073#1083#1086#1085#1091
    end
    object cxLabel3: TcxLabel
      Left = 107
      Top = 26
      Width = 435
      Height = 23
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ShadowedColor = clInfoBk
      Properties.ShowEndEllipsis = True
      Style.BorderColor = clBlack
      Style.BorderStyle = ebsSingle
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      Caption = ''
    end
    object cxAddButton: TcxButton
      Left = 370
      Top = 59
      Width = 75
      Height = 19
      Caption = #1044#1086#1076#1072#1090#1080
      TabOrder = 3
      OnClick = cxAddButtonClick
    end
    object cxDelButton: TcxButton
      Left = 455
      Top = 59
      Width = 75
      Height = 19
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 4
      OnClick = cxDelButtonClick
    end
    object cxLabel4: TcxLabel
      Left = 0
      Top = 26
      Width = 110
      Height = 23
      Align = alCustom
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clBlack
      Style.BorderStyle = ebsSingle
      Style.Color = clInfoBk
      TabOrder = 5
      Caption = ''
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 319
    Width = 542
    Height = 65
    Align = alBottom
    TabOrder = 1
    object applyButton: TcxButton
      Left = 320
      Top = 10
      Width = 125
      Height = 25
      Cancel = True
      Caption = #1047#1072#1089#1090#1086#1089#1091#1074#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
      ModalResult = 6
      TabOrder = 0
      OnClick = applyButtonClick
      LookAndFeel.Kind = lfUltraFlat
    end
    object cxButton2: TcxButton
      Left = 455
      Top = 10
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ModalResult = 2
      TabOrder = 1
    end
    object dxStatusBar1: TdxStatusBar
      Left = 1
      Top = 44
      Width = 540
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = 'Ins  -  '#1044#1086#1076#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = 'Del  -  '#1074#1080#1076#1072#1083#1080#1090#1080' '#1088#1072#1093#1091#1085#1086#1082' '#1110#1079' '#1089#1087#1080#1089#1082#1091
          Width = 200
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = 'Esc  -  '#1042#1110#1076#1084#1110#1085#1080#1090#1080
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 81
    Width = 542
    Height = 238
    Align = alClient
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 545
      Height = 241
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle1
        Styles.Content = cxStyle1
        Styles.Footer = cxStyle1
        Styles.Header = cxStyle3
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          MinWidth = 108
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          SortOrder = soAscending
          Width = 108
          DataBinding.FieldName = 'SCH_number'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
          Width = 433
          DataBinding.FieldName = 'SCH_title'
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Visible = False
          Options.Editing = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_sch'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel4: TPanel
      Left = 171
      Top = 72
      Width = 200
      Height = 60
      TabOrder = 1
      object ProgressBar1: TProgressBar
        Left = 10
        Top = 34
        Width = 180
        Height = 16
        Step = 1
        TabOrder = 0
      end
      object StaticText1: TStaticText
        Left = 10
        Top = 12
        Width = 121
        Height = 17
        Caption = #1047#1076#1110#1081#1089#1085#1102#1108#1090#1100#1089#1103' '#1086#1087#1077#1088#1072#1094#1110#1103
        TabOrder = 1
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 299
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clInfoBk
      TextColor = clRed
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 4707838
    end
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID_sch'
        DataType = ftInteger
      end
      item
        Name = 'SCH_number'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'SCH_title'
        DataType = ftString
        Size = 150
      end>
    Left = 48
    Top = 299
    object RxMemoryData1ID_sch: TIntegerField
      FieldName = 'ID_sch'
      Visible = False
    end
    object RxMemoryData1SCH_number: TStringField
      FieldName = 'SCH_number'
      Size = 150
    end
    object RxMemoryData1SCH_title: TStringField
      FieldName = 'SCH_title'
      Size = 150
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 80
    Top = 299
  end
  object ActionList1: TActionList
    Left = 8
    Top = 329
    object AddAccount: TAction
      Caption = 'AddAccount'
      ShortCut = 45
      OnExecute = AddAccountExecute
    end
    object DelAccount: TAction
      Caption = 'DelAccount'
      OnExecute = DelAccountExecute
    end
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 192
    Top = 297
  end
  object pFIBDatabase1: TpFIBDatabase
    DefaultTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 160
    Top = 297
  end
end
